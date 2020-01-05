# Ansible scripts for my Raspberry Pi cluster

## Install ansible (Arch)

```bash
yay -S ansible
```

## Operating

To gracefully shutdown all the nodes before powering off:

```bash
./cluster-shutdown.sh
```

Updating / Upgrading with APT package manager

```bash
./cluster-upgrade.sh
```

## Monitoring

Install prometheus node exporter on all cluster nodes

```bash
ansible-playbook -i hosts install-node-exporter.yml
```

## Utilities

Get CPU/GPU temps

```bash
ansible-playbook -i hosts get-temps.yaml
```

