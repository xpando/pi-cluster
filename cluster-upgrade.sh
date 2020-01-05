ansible all -i hosts -m apt -a "update_cache=yes upgrade=yes" --become -K
