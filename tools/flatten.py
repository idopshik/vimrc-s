#!/usr/bin/env python3
import os
import shutil
from pathlib import Path

def flatten_vim_folder(source_folder, target_folder=None):
    """
    Расплющивает папку: копирует все .vim файлы из подпапок в target_folder,
    переименовывая их в .txt, заменяя пути на подчеркивания.
    """
    source_path = Path(source_folder).expanduser().resolve()
    
    if not source_path.exists():
        print(f"Ошибка: папка {source_path} не существует")
        return False
    
    # Если target_folder не указан, создаем папку с суффиксом _flattened
    if target_folder is None:
        target_folder = f"{source_path}_flattened"
    
    target_path = Path(target_folder).expanduser().resolve()
    target_path.mkdir(parents=True, exist_ok=True)
    
    print(f"Копируем из: {source_path}")
    print(f"В папку: {target_path}\n")
    
    # Собираем все .vim файлы
    vim_files = list(source_path.rglob("*.vim"))
    
    if not vim_files:
        print("Не найдено .vim файлов")
        return False
    
    print(f"Найдено {len(vim_files)} .vim файлов\n")
    
    copied_count = 0
    for file_path in vim_files:
        # Получаем относительный путь от корня
        rel_path = file_path.relative_to(source_path)
        
        # Создаем новое имя: заменяем разделители на _ и .vim на .txt
        new_name = str(rel_path).replace(os.sep, "_").replace(".vim", ".txt")
        new_path = target_path / new_name
        
        # Если файл с таким именем уже существует, добавляем суффикс
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
    # ВАРИАНТ 1: Вы находитесь в C:\Users\st\.vim_runtime\vimrcs\
    # И хотите обработать текущую папку (vimrcs)
    source = "."  # текущая папка
    target = "./flatten"  # создаст папку flatten внутри текущей
    
    # ВАРИАНТ 2: Или укажите абсолютные пути
    # source = "C:\\Users\\st\\.vim_runtime\\vimrcs"
    # target = "C:\\Users\\st\\.vim_runtime\\vimrcs\\flatten"
    
    flatten_vim_folder(source, target)
