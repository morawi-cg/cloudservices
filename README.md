# cloudservices
<h1>Joined project for the AIE devops team</h1>
<h2>Step-by-step guide</h2>
<ul><h3>Team processes to construct product:</h3>
<li>Define a cloud based structure, (private or public cloud).</li>
<li>Configure the base files, (configuration files and source code shared on git hub).</li>
<li>Test and correct the code & configuration files. </li> 
</ul>
<h3>Icon</h3>
<p>The technical challenge specification as delivered by Project management team:
This task should demonstrate your grasp of key DevOps skills, such as working with source control, automation, orchestration and software
configuration management.</p>
 
<ul>Task
<li>a) <p>Launch 3 separate linux nodes using the tool/distro of your choice</p>
<p>2 x application nodes</p>
<p>1 x web node</p></li></ul>
 
<ul>b) Using a configuration management tool
<p>Deploy the sample application to the application nodes</p>
<p>Install Nginx on the web node and balance requests to the application nodes in a round-robin fashion</p>
<p>Demonstrate the round-robin mechanism is working correctly</p></ul>
 
<ul>Goal
<p>Sending a HTTP request to the web node should return the response</p>
<p>Hi there, I'm served from "application node hostname"! </p></ul>
 
<ul>Considerations
<p>Share your work on a public git repo</p>
<p>Include a README.md with clear and concise instructions</p>
<p>Invocation should be a one line command string</p>
<p>Take care not to over engineer a solution</p></ul>
 
<ul>Bonus point</ul>
<li>For changes to the sample code, automate the build and delivery to the environment using Drone.<li>
 
'''Sample application code (Go)'''
package main
import (
"fmt"
"net/http"
"os"
) 
 
func handler(w http.ResponseWriter, r *http.Request) {
h, _ := os.Hostname()
fmt.Fprintf(w, "Hi there, I'm served from %s!", h)
}
 
func main() {
http.HandleFunc("/", handler)
http.ListenAndServe(":8484", nil)
}
 '''
