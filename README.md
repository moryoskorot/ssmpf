# ssmpf
A script to run the ssm port forwarding command quicker and with less text on screen.

The original command looks like this
```
aws ssm start-session --target $ssmpf_instance_id --document-name AWS-StartPortForwardingSession --parameters "localPortNumber=${ssmpf_local_port},portNumber=${ssmpf_remote_port}"
```
Which is long and messy to look at
This script allows you to run the following instead
```
ssmpf -i <Instance_id> -r <Remote Port> -l <Local Port>
```

which is much nicer to look at ,and musch simpler to modify on the go
