<h1> Cloudservices</h1> 
<p>Collaboration project for the AIE devops team</p>
<h2>Step-by-step guide</h2>
<h3>Team processes to construct product:</h3>
<ul><li>Define a cloud based structure, (private or public cloud).</li>
<li>Configure the base files, (configuration files and source code shared on git hub).</li>
<li>Test and correct the code & configuration files. </li> 
</ul>

<p>The technical challenge specification as delivered by Project management team:
This task should demonstrate your grasp of key DevOps skills, such as working with source control, automation, orchestration and software
configuration management.</p>
 
<b>Task</b><br><br>
a) Launch 3 separate linux nodes using the tool/distro of your choice
<li>2 x application nodes</li>
<li>1 x web node</li></ul>
 
b) Using a configuration management tool
<li>Deploy the sample application to the application nodes</li>
<li>Install Nginx on the web node and balance requests to the application nodes in a round-robin fashion</li>
<li>Demonstrate the round-robin mechanism is working correctly</li></ul>
 
<b>Goal</b>
<p>Sending a HTTP request to the web node should return the response, " Hi there, I'm served from "application node hostname"! "</p>
 
<b>Considerations</b>
<ul><li>Share your work on a public git repo</li>
<li>Include a README.md with clear and concise instructions</li>
<li>Invocation should be a one line command string</li>
<li>Take care not to over engineer a solution</li></ul>
 
<b>Bonus point</b>
<p>For changes to the sample code, automate the build and delivery to the environment using Drone.</p>
 
 <p><b>Sample application code (Go)</b></p>
```
package main
import (
"fmt"
"net/http"
"os"
) 
``` 
```
func handler(w http.ResponseWriter, r *http.Request) {
h, _ := os.Hostname()
fmt.Fprintf(w, "Hi there, I'm served from %s!", h)
}
```

```
func main() {
http.HandleFunc("/", handler)
http.ListenAndServe(":8484", nil)
}
```

---

<b><u><h3> Cloud Structure </h3></u></b>

<b>Load Balancing with 'NGINX':</b>
<p>This web server is one of the fastest and most reliable web servers. It has taken a large portion of the web server market since its launch. Written in a very efficient way makes it the most suitable for large scale high load deployments. 
This template represents the configuration options that need to be finalized for this webserver to be running as a load balancer. </p>

```
http {
    server {
        listen 80;
        location / { proxy_pass http://backend; 
           } 
        }
    
    upstream backend { 
        server web-server1:5000;
        server web-server2:5000; 
        } 
     }
 ```
<p>The Two servers at the bottom represent our python(app) servers. Our app is dependent upon Python3.4, Flask, uwsgi and Pip3.</p> 

<b> Build Script </b>

```
#!/bin/bash

sudo add-apt-repository ppa:nginx/stable
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install nginx
sudo /etc/init.d/nginx start


exit 0
```
<b>Load balancing</b><br>

<p>Load balancing across multiple application instances is a commonly used technique for optimizing resource utilization, maximizing throughput, reducing latency, and ensuring fault-tolerant configurations.</p>

<p>It is possible to use nginx as a very efficient HTTP load balancer to distribute traffic to several application servers and to improve performance, scalability and reliability of web applications with nginx.</p>

<b>Load balancing methods</b>

The following load balancing mechanisms (or methods) are supported in nginx:

<ul><li>round-robin — requests to the application servers are distributed in a round-robin fashion,</li>
<li>least-connected — next request is assigned to the server with the least number of active connections,</li>
<li>ip-hash — a hash-function is used to determine what server should be selected for the next request (based on the client’s IP address).</li></ul>

<b> Logical Concept Design </b>

<img src="https://raw.githubusercontent.com/morawi-cg/cloudservices/master/CloudService.PNG" alt="Cloud Data Design" >

<b><p>Security Group</b>

<p>Amazon VPC provides features that you can use to increase and monitor the security for your VPC:</p>

<ul><li>Security groups — Act as a firewall for associated Amazon EC2 instances, controlling both inbound and outbound traffic at the instance level</li>
<li>Network access control lists (ACLs) — Act as a firewall for associated subnets, controlling both inbound and outbound traffic at the subnet level</li>
<li>Flow logs — Capture information about the IP traffic going to and from network interfaces in your VPC</li></ul>

<p>In this example were using the security groups to controll our inbound and outbound (ingress or egress) traffic, namely for ngix and igress routing.</p>

<br>

<img src="https://raw.githubusercontent.com/morawi-cg/cloudservices/master/Cloud_Services_Security_Groups.PNG" alt="Cloud Security Group">

<b> Python Process Interaction </b>

<br> 
<img src="https://raw.githubusercontent.com/morawi-cg/cloudservices/master/Python-Process-Interaction.PNG">

<br>
<p>The process in more depth</p>
<img src="https://raw.githubusercontent.com/morawi-cg/cloudservices/master/Process-Integration.png" alt= "Diagram of the Artitectture">

```
resource "aws_security_group" "app2" {
  name = "Security-Group-NGINX-Internal2"
  description = "Firewall rules for the app server to the webserver "

  egress {
      from_port = 5000
      to_port = 5000
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"] 
  }
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]    
  }
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

```


<b><p>NGINX-Deployment</p></b>
<p> Started the nginx confiuration adjustment,(on  NGINX) by adding the 'app-holder' folder into the '/var/www/appholder' to that webserver's path.</p>

<p> The application was added to that folder. The default confiuration was removed </p>

```
     sudo mkdir /var/www/appholder
     sudo cp appserver.py /var/www/appholder
     sudo rm /etc/nginx/sites-enabled/default
```
<br>



<b><p>Links</p></b> 
<p>One key link to our details on web config 
https://www.digitalocean.com/community/tutorials/how-to-set-up-uwsgi-and-nginx-to-serve-python-apps-on-ubuntu-14-04 <p>

<b><h3>Steps to Follow: </h3></b>
<br>
<b>Step 1: Elastic IP </b>

This is for the external ip to access from client to our ip.

<img src="https://raw.githubusercontent.com/morawi-cg/cloudservices/master/AWS_ExternalP_to_natted_structure.PNG" alt="Image showing The elastic IP is created">
<br>

<b>Step 2: Nat Gateway </b>

Subnet mask send to communicate with the elastic IP

<img src="https://raw.githubusercontent.com/morawi-cg/cloudservices/master/AWS_Allocate_Static_Elastic_IP.PNG" alt="Diagram Showing illustration of an Elastic IP">
<br>

<b>Step 3:  AWS Subnets </b>

Once  you created those you aws should show you an subnet with its assosciated vpc ip.

<img src="https://raw.githubusercontent.com/morawi-cg/cloudservices/master/AWS_Subnets_Assosiated.PNG" alt="Image of the AWS subnets">
<br>


