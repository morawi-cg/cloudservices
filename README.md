<h1> Cloudservices</h1> 
<h2>Collaboration project for the AIE devops team</h2>
<h2>Step-by-step guide</h2>
<h3>Team processes to construct product:</h3>
<ul><li>Define a cloud based structure, (private or public cloud).</li>
<li>Configure the base files, (configuration files and source code shared on git hub).</li>
<li>Test and correct the code & configuration files. </li> 
</ul>
<b>Icon</b>
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
<li>For changes to the sample code, automate the build and delivery to the environment using Drone.<li>
 
Sample application code (Go)
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
