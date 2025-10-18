# DevOps Environment Setup & Validation Script

This repository contains a single Bash script that **configures and validates a DevOps-ready Linux environment**.  
It automates initial setup steps: installing Git, configuring user information, and testing SSH authentication with GitHub, while verifying that everything is working as expected.

---

## 1. Purpose

This project provides a **clean and reproducible environment check** for beginners in DevOps.  
It helps ensure your local setup is properly configured before working with automation tools such as Docker, CI/CD pipelines, or Infrastructure as Code.

---

## 2. Features

- Updates and upgrades system packages  
- Installs and configures Git  
- Displays configured Git username and email  
- Checks operating system version  
- Validates SSH authentication with GitHub  
- Produces readable diagnostic output for quick verification  

---

## 3. Repository Structure

```
📁 devops-environment/
│
├── devops-setup.bash     
└── README.md              
```

---

## 4. Usage

Make the script executable:
```bash
chmod +x devops-setup.bash
```

Run the script:
```bash
./devops-setup.bash
```

Expected output example:
```
🔹 Updating system packages...
🔹 Installing Git...
🔹 Configuring Git...
✅ Setup complete. Your environment is ready!

🔹 Checking operating system...
System: Ubuntu 24.04 LTS

🔹 Checking Git configuration...
✅ Git user configuration detected:
   Name:  Example
   Email: example@example.com

🔹 Testing SSH authentication with GitHub...
✅ SSH authentication with GitHub is working.
```




