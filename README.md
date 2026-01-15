# Auto Websetup
This repo is me automating a simple web server setup with **Vagrant** and **Bash scripting**.  
Originally I was doing everything manually — installing packages, starting Apache, copying files into `/var/www/html`. It worked, but it was repetitive and error‑prone. So I decided to fix that by writing a provisioning script that Vagrant runs automatically. Now the whole thing is reproducible with one command.

## What’s inside

1.**Vagrantfile**  
  Defines the CentOS Stream 9 VM (via VirtualBox), sets up networking, memory, hostname, and points to the provisioning script.

2.**3_args_websetup.sh**  
  Bash script that:
  - Installs required packages (`wget`, `httpd`, `unzip`)
  - Starts and enables Apache
  - Downloads a sample template from [tooplate.com](https://www.tooplate.com/)
  - Unzips and copies files into `/var/www/html`
  - Cleans up temporary files
  - Restarts Apache so the site is live
    
## How to run

1. Clone this repo.  
2. Make sure you have [Vagrant](https://www.vagrantup.com/) and VirtualBox installed.  
3. Run:
   vagrant up and open http://192.168.10.12 in your browser

##Why this exists
Manual execution was a pain. Every time I booted the VM I had to re‑run commands, reinstall stuff, and redeploy the site. That’s not fun and it’s easy to mess up. By moving everything into a Bash script and letting Vagrant handle provisioning, the process is automated. It’s consistent, repeatable, and anyone cloning the project can get the same environment with one command.

## Notes
- You don’t need to run the script manually — Vagrant does it for you.
- The script is idempotent, so re‑provisioning (vagrant provision) won’t break things.
- Replace the template files in /var/www/html if you want to customize the site.
