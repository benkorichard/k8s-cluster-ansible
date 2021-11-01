#!/bin/bash

function keys {
    local keys=()

    for key_file in $(ls /home/vagrant/ssh/*.pub)
    do
        keys=("${keys[@]}" "$(cat ${key_file})")
    done

    for key in "${keys[@]}"
    do
        echo ${key}
    done
}

function user {
    local user=${1}
    local ssh_dir="/home/${user}/.ssh"

    if ! getent passwd "${user}"
    then
        useradd -s /bin/bash -m "${user}"
        echo "${user} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${user}"

        if [[ ! -d ${ssh_dir} ]]
        then
            mkdir "${ssh_dir}"
            chown "${user}":"${user}" "${ssh_dir}"
        fi
        keys > "${ssh_dir}/authorized_keys"
    fi
}

function main {

    user "ubuntu"

    swapoff -a
    sed -i '/ swap / s/^/#/' /etc/fstab

    rm -rf /home/vagrant/ssh

    reboot
}

main