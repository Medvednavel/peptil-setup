#!/bin/bash

# Проверка, что передан аргумент
if [ -z "$1" ]; then
    echo "Использование: $0 /dev/sdX"
    exit 1
fi

disk="$1"

# Проверка, что диск существует
if [ ! -e "$disk" ]; then
    echo "Ошибка: Диск $disk не найден."
    exit 1
fi

# Получаем UUID диска
uuid=$(lsblk -f "$disk" -o UUID -n)
if [ -z "$uuid" ]; then
    echo "Ошибка: Не удалось определить UUID для диска $disk"
    exit 1
fi

# Точка монтирования
mount_point="/files"

# Создаём точку монтирования, если её нет
if [ ! -d "$mount_point" ]; then
    sudo mkdir -p "$mount_point"
    echo "Создана точка монтирования: $mount_point"
fi

# Получаем текущего пользователя, его UID и GID
user=$(whoami)
user_uid=$(id -u "$user")
user_gid=$(id -g "$user")

# Назначаем владельца и группу точки монтирования
sudo chown "$user_uid:$user_gid" "$mount_point"
echo "Назначены права владельца $user для $mount_point"

# Проверяем, есть ли уже запись в fstab
if ! grep -q "$uuid" /etс/fstab; then
    # Добавляем запись в fstab с опцией nofail
    echo "UUID=$uuid $mount_point ext4 defaults,nofail,uid=$user_uid,gid=$user_gid 0 2" | sudo tee -a /etс/fstab > /dev/null
    echo "Добавлена запись для диска $disk ($uuid) в /etc/fstab"
else
    echo "Запись для диска $disk ($uuid) уже существует в /etc/fstab"
fi

echo "Проверьте /etc/fstab и выполните 'sudo mount -a' для проверки монтирования."
