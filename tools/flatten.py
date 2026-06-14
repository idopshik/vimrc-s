#!/usr/bin/env python3
import os
import shutil
from pathlib import Path

def flatten_vim_folder(source_folder=".", target_folder="flatten"):
    """
    Расплющивает папку: копирует все .vim файлы из подпапок source_folder
    в папку target_folder, переименовывая их в .txt,
    заменяя пути на подчёркивания.
    
    Перед копированием папка target_folder полностью удаляется (если существует)
    и создаётся заново.
    """
    source_path = Path(source_folder).expanduser().resolve()
    target_path = Path(target_folder).expanduser().resolve()
    
    if not source_path.exists():
        print(f"Ошибка: папка {source_path} не существует")
        return False
    
    # --- Очистка/создание target_folder ---
    if target_path.exists():
        print(f"Папка {target_path} уже существует. Удаляем её содержимое...")
        shutil.rmtree(target_path)   # удаляем всю папку рекурсивно
        print("Старая папка удалена.")
    
    # Создаём чистую папку
    target_path.mkdir(parents=True, exist_ok=True)
    print(f"Создана папка: {target_path}\n")
    
    # Собираем все .vim файлы
    vim_files = list(source_path.rglob("*.vim"))
    if not vim_files:
        print("Не найдено .vim файлов")
        return False
    
    print(f"Найдено {len(vim_files)} .vim файлов\n")
    
    copied_count = 0
    for file_path in vim_files:
        # Относительный путь от корня source_folder
        rel_path = file_path.relative_to(source_path)
        
        # Новое имя: заменяем разделители на _, расширение .vim -> .txt
        new_name = str(rel_path).replace(os.sep, "_").replace(".vim", ".txt")
        new_path = target_path / new_name
        
        # Если имя совпадает (например, два файла с одинаковыми путями),
        # добавляем суффикс (маловероятно, но на всякий случай)
        counter = 1
        original_new_path = new_path
        while new_path.exists():
            name_without_ext = original_new_path.stem
            new_path = original_new_path.with_name(f"{name_without_ext}_{counter}.txt")
            counter += 1
        
        print(f"Копируем: {rel_path} -> {new_path.name}")
        shutil.copy2(str(file_path), str(new_path))
        copied_count += 1
    
    print(f"\nГотово! Скопировано {copied_count} файлов в {target_path}")
    return True

if __name__ == "__main__":
    # Можно запускать без аргументов (текущая папка -> папка flatten)
    # или с двумя аргументами: source_folder, target_folder
    import sys
    if len(sys.argv) > 1:
        source = sys.argv[1]
    else:
        source = "."
    
    if len(sys.argv) > 2:
        target = sys.argv[2]
    else:
        target = "./flatten"
    
    flatten_vim_folder(source, target)
