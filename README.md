# Ansible-Playthrough
Get started with Ansible Automation Platform by using Vagrantfile to set up a Local Linux Environment with Vagrant 

# Read in GitBook (Thai)
[GitBook 📚](https://lezgend.gitbook.io/ansible-playthrough/)

# Topology
![Topology](https://github.com/Lezgend/Ansible-Playthrough/blob/main/images/topology.svg)

# Start the Vagrant VM
```bash
vagrant up
```

```bash
---Output---
Current machine states:

alpine1                   running (virtualbox)
alpine2                   running (virtualbox)
alpine3                   running (virtualbox)
alpine4                   running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```

Check outputs status of the vagrant machine
```bash
vagrant status
```

```bash
---Output---
Current machine states:

alpine1                   running (virtualbox)
alpine2                   running (virtualbox)
alpine3                   running (virtualbox)
alpine4                   running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
```
# Testing the Ansible Ping Module
```bash
ansible all -m ping -v
```

```bash
---Output---
alpine1 | SUCCESS => {
    "ansible_facts": { "discovered_interpreter_python": "/usr/bin/python3.10"}
    "changed": false, 
    "ping": "pong"
}
alpine2 | SUCCESS => {
    "ansible_facts": { "discovered_interpreter_python": "/usr/bin/python3.10"}
    "changed": false, 
    "ping": "pong"
}
alpine3 | SUCCESS => {
    "ansible_facts": { "discovered_interpreter_python": "/usr/bin/python3.10"}
    "changed": false, 
    "ping": "pong"
}
alpine4 | SUCCESS => {
    "ansible_facts": { "discovered_interpreter_python": "/usr/bin/python3.10"}
    "changed": false, 
    "ping": "pong"
}
```

# Play with Ansible Playbook
```bash
ansible-playbook playbooks/install_nginx.yaml
```
# Validating tasks
```bash
curl 192.168.56.10
curl 192.168.56.20
curl 192.168.63.10
curl 192.168.63.20
```
```html
warayut@argonaut:~/ansible-playthrough$ curl 192.168.56.10
<html>
  <head>
    <title>Ansible-Playthrough by Warayut</title>
  </head>

  <body>
  <h1>NGINX is running on alpine1</h1>
  <p>This web server is configured and operated by Ansible</p>
  </body>
</html>
warayut@argonaut:~/ansible-playthrough$ curl 192.168.56.20
<html>
  <head>
    <title>Ansible-Playthrough by Warayut</title>
  </head>

  <body>
  <h1>NGINX is running on alpine2</h1>
  <p>This web server is configured and operated by Ansible</p>
  </body>
</html>
warayut@argonaut:~/ansible-playthrough$ curl 192.168.63.10
<html>
  <head>
    <title>Ansible-Playthrough by Warayut</title>
  </head>

  <body>
  <h1>NGINX is running on alpine3</h1>
  <p>This web server is configured and operated by Ansible</p>
  </body>
</html>
warayut@argonaut:~/ansible-playthrough$ curl 192.168.63.20
<html>
  <head>
    <title>Ansible-Playthrough by Warayut</title>
  </head>

  <body>
  <h1>NGINX is running on alpine4</h1>
  <p>This web server is configured and operated by Ansible</p>
  </body>
</html>
```
