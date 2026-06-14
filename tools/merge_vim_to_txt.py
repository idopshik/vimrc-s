#!/usr/bin/env python3
import os
import shutil
import sys
from pathlib import Path

def merge_vim_to_flatten(source_dir=".", output_name="merged_vim_config.txt", flatten_dir="flatten"):
    source_path = Path(source_dir).expanduser().resolve()
    flatten_path = Path(flatten_dir).expanduser().resolve()

    if not source_path.is_dir():
        print(f"Ошибка: {source_path} не папка")
        return False

    # Очистка/создание папки flatten
    if flatten_path.exists():
        shutil.rmtree(flatten_path)
    flatten_path.mkdir(parents=True)

    # Итоговый файл внутри flatten
    output_file = flatten_path / output_name

    # Сбор .vim файлов
    vim_files = list(source_path.rglob("*.vim"))
    if not vim_files:
        print("Нет .vim файлов")
        return False

    vim_files.sort()

    with open(output_file, 'w', encoding='utf-8') as out:
        out.write("=" * 80 + "\n")
        out.write(f"Сводный конфиг из: {source_path}\n")
        out.write(f"Файлов: {len(vim_files)}\n")
        out.write("=" * 80 + "\n\n")

        for idx, f in enumerate(vim_files, 1):
            rel = f.relative_to(source_path)
            out.write("\n" + "=" * 80 + "\n")
            out.write(f"ФАЙЛ {idx}/{len(vim_files)}: {rel}\n")
            out.write("=" * 80 + "\n")
            try:
                out.write(f.read_text(encoding='utf-8', errors='replace'))
            except Exception as e:
                out.write(f"[Ошибка чтения: {e}]\n")
            out.write("\n" + "-" * 40 + "\n")
            out.write(f"КОНЕЦ {rel}\n\n")

    print(f"Готово! Файл создан: {output_file}")
    return True

if __name__ == "__main__":
    source = sys.argv[1] if len(sys.argv) > 1 else "."
    merge_vim_to_flatten(source)
