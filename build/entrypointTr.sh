#!/usr/bin/env bash
if [ ! -z "${DEBUG}" ]; then
    set -x
fi

USER_ID=$(stat -c %u /work/point2cad) 
GROUP_ID=$(stat -c %g /work/point2cad) 

USER_ID=99
GROUP_ID=99

echo ${USER_ID}
echo ${GROUP_ID}

# 그룹이 이미 존재하는지 확인하고, 없다면 생성

groupadd -g $GROUP_ID usergroup



useradd -m -l -u $USER_ID -g $GROUP_ID user



if [ ! -z "${DEBUG}" ]; then
    env
    whoami
    groups
    python -c "import torch; print(torch.cuda.is_available())"
    ls -l /dev/nvidia*
    gosu user env
    gosu user whoami
    gosu user groups
    gosu user python -c "import torch; print(torch.cuda.is_available())"
    gosu user ls -l /dev/nvidia*
fi
exec gosu user "$@"
# exec "$@"
