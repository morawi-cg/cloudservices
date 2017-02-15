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
<h3> Cloud Structure </h3>

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
<p>The Two servers at the bottom represent our python(app) servers. Our app is dependent upon Python3.4, Flask and Pip3.</p> <br>

<b>Load balancing</b><br>

<p>Load balancing across multiple application instances is a commonly used technique for optimizing resource utilization, maximizing throughput, reducing latency, and ensuring fault-tolerant configurations.</p>

<p>It is possible to use nginx as a very efficient HTTP load balancer to distribute traffic to several application servers and to improve performance, scalability and reliability of web applications with nginx.</p>

<b> Logical Concept Design <b>

<img src="https://raw.githubusercontent.com/morawi-cg/cloudservices/master/CloudService.PNG" alt="Cloud Data Design" >

<b>Security Group</b>

<br> 
<img src="https://raw.githubusercontent.com/morawi-cg/cloudservices/master/Cloud_Services_Security_Groups.PNG" alt="Cloud Security Group">



