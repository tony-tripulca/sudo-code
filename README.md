# sudo-code

`sudo-code` is a simple Bash script that allows you to **edit root-owned files in VS Code (Remote SSH)** safely and seamlessly.  

It works by creating a temporary editable copy of the file in your home directory, letting you edit in the GUI, then saving back with `sudo` and cleaning up the temp file automatically.

Useful when working on:

1. AWS EC2
2. Virtual Private Hosts
3. Digital Ocean (Droplets)
4. Google Cloud (GCP)

## **Features**

- Open any root-owned file in VS Code GUI via Remote SSH  
- Save changes back with `sudo` automatically  
- Temporary files are cleaned up after saving  
- Works for files in `/etc`, `/var`, or any location on your system  
- No additional VS Code extensions required  

## **Installation**

1. Clone the repository:

```bash
git clone git@github.com:tony-tripulca/sudo-code.git
cd ~/sudo-code
```

2. Make the script executable:

```bash
chmod +x sudo-code.sh
```

3. Create a symlink in /usr/local/bin for global access:

```bash
sudo ln -s ~/sudo-code/sudo-code.sh /usr/local/bin/sudo-code
```

Now you can run sudo-code from anywhere. Using a symlink keeps your Git repo intact so you can update it via `git pull` anytime.

## **Usage**

1. Open a root-owned file

```bash
sudo-code /etc/apache2/sites-available/your-website.com.conf
```

2. Save changes

    **Note:** After editing, go back to the terminal and press Enter.
   
    The script will automatically:
   1. Copy the changes back to the original root-owned file using sudo
   2. Remove the temporary file

## **Remarks**
- Make sure you are connected to your server via VS Code Remote SSH.
- The script works with any file path (`/etc`, `/var`, `/home`, etc.).