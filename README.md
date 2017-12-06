## Pivorak-osx-dev

It's always painful when a new developer joins the team and we don't have a proper onboarding procedure. He should spend the very first day of set-up his development environment. The problem on READMEs and other manuals that they need to be kept up-to-date. And it's another waste of time and efforts. So then we need somebody who is good at deployment to help the member to get things done. In other words, a daily-buddy is required. Yet another waste of time and resources, again.

The script deploys development environment for https://pivorak.com/ into [Vagrant](https://www.vagrantup.com/) Virtual Machine with Ansible.
Runtime and state VM availability are being proved with [Chef InSpec](https://www.inspec.io/) tests.

So then, in several minutes, we will have properly deployed, well-tested, and ready-to-work development environment.

It's easy can be changed to deploy into cloud services like Digital Ocean or AWS. 

[![Pivarak-osx-dev](https://img.youtube.com/vi/X9EFMeGTMo4/0.jpg)](https://www.youtube.com/watch?v=X9EFMeGTMo4)

[Look it in action...](https://www.youtube.com/watch?v=X9EFMeGTMo4)

# Requirements

* Homebrew + Cask
* Virtualbox
* Vagrant

# Homebrew

```
brew cask install vagrant virtualbox
```

rails s -b 0.0.0.0
ansible-playbook -i hosts site.yml

# Testing

```
gem install inspec
```

[![pivorak-dev-test-result0.png](https://github.com/romanvbabenko/pivorak-dev/blob/master/pivorak-dev-test-result0.png)
