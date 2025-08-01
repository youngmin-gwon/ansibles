# Mac Development Ansible Playbook

This playbook installs and configures most of the software I use on my Mac for web and software development. Some things in macOS are slightly difficult to automate, so I still have a few manual installation steps, but at least it's all documented here.

## Installation

  1. Ensure Apple's command line tools are installed (`xcode-select --install` to launch the installer).
  2. [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html):

     1. Install [Python](https://www.python.org/downloads/) and set path
     2. Set Python Virtual Environment `python -m venv .venv && source .venv/bin/activate`
     3. Upgrade Pip: `sudo pip3 install --upgrade pip`
     4. Install Ansible: `pip3 install ansible requests docker`

  3. Clone or download this repository to your local drive.
  4. Run `ansible-galaxy install -r requirements.yml` inside this directory to install required Ansible roles.
  5. Run `ansible-playbook playbook_macos_dev.yml --tags "macos,unix" -K --ask-vault-pass` inside this directory. Enter your macOS account password when prompted for the 'BECOME' password.

> Note: If some Homebrew commands fail, you might need to agree to Xcode's license or fix some other Brew issue. Run `brew doctor` to see if this is the case.

## Author

This project was created by [Youngmin Gwon](https://www.github.com/youngmin-gwon) (originally inspired by [geerlingguy/mac-dev-playbook](https://github.com/geerlingguy/mac-dev-playbook)).
