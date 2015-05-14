
box = "chef/centos-7.0"

MACHINES = [
  {
    "hostname"=> "ll-web",
    "ip"=> "192.168.35.3",
    "box"=> box,
    "memory"=> 512,
    "cpus"=> 1,
    "ports"=> [ [80, 8082], ],
    "ansible_groups" => ["learninglocker"]
  },
  {
    "hostname"=> "ll-db",
    "ip"=> "192.168.35.4",
    "box"=> box,
    "memory"=> 1024,
    "cpus"=> 1,
    "ports"=> [],
    "ansible_groups" => ["database"]
  },
]


MONGO_HOST = "192.168.35.4"