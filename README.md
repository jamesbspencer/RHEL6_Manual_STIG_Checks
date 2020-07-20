# Red Hat Linux 6 STIG Manual Checks
This is a collection of scripts that help to automate the process of performing the checks on STIG items left over from using the SCAP scanning tool. 

###### Updated for STIG Version 1 Release 25 and SCAP Version 1 Release 27, April 24, 2020

## Installation
Download the latest package file and extract. Copy all files and folders to your jump server, if you have one. 

## Usage
If you have Ansible, use the supplied .yml file to push stig_checks.zip to your systems, run the scan, and pull back the results. Or you can copy stig_checks.zip to the server you want to check, extract, and run stig_check.sh. Once you have the results file, in .ckl format. Import it into an existing STIG checklist.

## File Descriptions
- stig_checks.sh - Loops through the shell scripts in the rules folder and populates the base checklist with STIG check results.
- ~ManualChecks.ckl - The base checklist. The STIG checklist rules leftover from subtracting a SCAP profile from a STIG checklist.
- tools/Create-ManualChecklistFile.ps1 - A Powershell script that subtracts a SCAP profile from a STIG checklist to create our ~ManuaChecks.ckl file.
- *ansible_push_stig_checks.yml - (Optional) An Ansible playbook that pushes the rules folder, stig_checks.sh, and ~ManualChecks.ckl to the server(s) to be checked, executes the scripts, and pulls back the results. 

## NEW for this version
- V-51363 - Updated the requirement and check to include HBSS verbiage.
- V-38655 - Updated the check content to focus on "removable media" and added example text.
- V-38617 - Updated the check command; added example text and refined the finding statement.
- V-38608 - Updated the finding statement to allow for values less than or equal to "900".
- V-100011 - Added a requirement to remove any ".shosts" and/or "shosts.equiv" files on the system.
- V-100013 - Added a requirement for the configuation of MACs in SSH.

## Includes shell scripts for the following rules
- SV-50244r2_rule V-38444 The systems local IPv6 firewall must implement a deny-all, allow-by-exception policy for inbound packets.
- SV-50245r2_rule V-38445 Audit log files must be group-owned by root.
- SV-50246r2_rule V-38446 The mail system must forward all mail for root to one or more system administrators.
- SV-50247r4_rule V-38447 The system package management tool must verify contents of all files associated with packages.
- SV-50252r2_rule V-38452 The system package management tool must verify permissions on all files and directories associated with packages.
- SV-50253r2_rule V-38453 The system package management tool must verify group-ownership on all files and directories associated with packages.
- SV-50254r2_rule V-38454 The system package management tool must verify ownership on all files and directories associated with packages.
- SV-50260r1_rule V-38460 The NFS server must not have the all_squash option enabled.
- SV-50264r1_rule V-38464 The audit system must take appropriate action when there are disk errors on the audit storage volume.
- SV-50265r3_rule V-38465 Library files must have mode 0755 or less permissive.
- SV-50266r4_rule V-38466 Library files must be owned by a system account.
- SV-50268r1_rule V-38468 The audit system must take appropriate action when the audit storage volume is full.
- SV-50271r1_rule V-38471 The system must forward audit records to the syslog service.
- SV-50274r2_rule V-38474 The system must allow locking of graphical desktop sessions.
- SV-50278r2_rule V-38478 The Red Hat Network Service (rhnsd) service must not be running, unless using RHN or an RHN Satellite.
- SV-50281r1_rule V-38481 System security patches and updates must be installed and up-to-date.
- SV-50285r2_rule V-38484 The operating system, upon successful logon, must display to the user the date and time of the last logon or access via ssh.
- SV-50287r1_rule V-38486 The operating system must conduct backups of system-level information contained in the information system per organization defined frequency to conduct backups that are consistent with recovery time and recovery point objectives.
- SV-50289r1_rule V-38488 The operating system must conduct backups of user-level information contained in the operating system per organization defined frequency to conduct backups consistent with recovery time and recovery point objectives.
- SV-50294r1_rule V-38493 Audit log directories must have mode 0755 or less permissive.
- SV-50297r3_rule V-38496 Default operating system accounts, other than root, must be locked.
- SV-50314r2_rule V-38513 The systems local IPv4 firewall must implement a deny-all, allow-by-exception policy for inbound packets.
- SV-50320r2_rule V-38519 All rsyslog-generated log files must be group-owned by root.
- SV-50321r1_rule V-38520 The operating system must back up audit records on an organization defined frequency onto a different system or media than the system being audited.
- SV-50322r1_rule V-38521 The operating system must support the requirement to centrally manage the content of audit records generated by organization defined information system components.
- SV-50350r3_rule V-38549 The system must employ a local IPv6 firewall.
- SV-50352r3_rule V-38551 The operating system must connect to external networks or information systems only through managed IPv6 interfaces consisting of boundary protection devices arranged in accordance with an organizational security architecture.
- SV-50354r3_rule V-38553 The operating system must prevent public IPv6 access into an organizations internal networks, except as appropriately mediated by managed interfaces employing boundary protection devices.
- SV-50361r2_rule V-38560 The operating system must connect to external networks or information systems only through managed IPv4 interfaces consisting of boundary protection devices arranged in accordance with an organizational security architecture.
- SV-50368r4_rule V-38567 The audit system must be configured to audit all use of setuid and setgid programs.
- SV-50394r3_rule V-38593 The Department of Defense (DoD) login banner must be displayed immediately prior to, or as part of, console login prompts.
- SV-50396r3_rule V-38595 The system must be configured to require the use of a CAC, PIV compliant hardware token, or Alternate Logon Token (ALT) for authentication.
- SV-50397r3_rule V-38596 The system must implement virtual address space randomization.
- SV-50398r3_rule V-38597 The system must limit the ability of processes to have simultaneous write and execute access to memory.
- SV-50400r3_rule V-38599 The FTPS/FTP service on the system must be configured with the Department of Defense (DoD) login banner.
- SV-50410r3_rule V-38609 The TFTP service must not be running.
- SV-50418r3_rule V-38617 The SSH daemon must be configured to use only FIPS 140-2 approved ciphers.
- SV-50420r2_rule V-38619 There must be no .netrc files on the system.
- SV-50424r2_rule V-38623 All rsyslog-generated log files must have mode 0600 or less permissive.
- SV-50425r1_rule V-38624 System logs must be rotated daily.
- SV-50429r2_rule V-38628 The operating system must produce audit records containing sufficient information to establish the identity of any user/subject associated with the event.
- SV-50432r2_rule V-38631 The operating system must employ automated mechanisms to facilitate the monitoring and control of remote access methods.
- SV-50433r2_rule V-38632 The operating system must produce audit records containing sufficient information to establish what type of events occurred.
- SV-50435r2_rule V-38634 The system must rotate audit log files that reach the maximum file size.
- SV-50438r2_rule V-38637 The system package management tool must verify contents of all files associated with the audit package.
- SV-50444r3_rule V-38643 There must be no world-writable files on the system.
- SV-50453r2_rule V-38652 Remote file systems must be mounted with the nodev option.
- SV-50454r2_rule V-38653 The snmpd service must not use a default password.
- SV-50455r2_rule V-38654 Remote file systems must be mounted with the nosuid option.
- SV-50456r2_rule V-38655 The noexec option must be added to removable media partitions.
- SV-50458r2_rule V-38657 The system must use SMB client signing for connecting to samba servers using mount.cifs.
- SV-50460r2_rule V-38659 The operating system must employ cryptographic mechanisms to protect information in storage.
- SV-50461r2_rule V-38660 The snmpd service must use only SNMP protocol version 3 or newer.
- SV-50462r2_rule V-38661 The operating system must protect the confidentiality and integrity of data at rest. 
- SV-50463r2_rule V-38662 The operating system must employ cryptographic mechanisms to prevent unauthorized disclosure of data at rest unless otherwise protected by alternative physical measures.
- SV-50464r1_rule V-38663 The system package management tool must verify permissions on all files and directories associated with the audit package.
- SV-50465r1_rule V-38664 The system package management tool must verify ownership on all files and directories associated with the audit package.
- SV-50466r1_rule V-38665 The system package management tool must verify group-ownership on all files and directories associated with the audit package.
- SV-50468r3_rule V-38667 The system must have a host-based intrusion detection tool installed.
- SV-50471r2_rule V-38670 The operating system must detect unauthorized changes to software and information. 
- SV-50474r2_rule V-38673 The operating system must ensure unauthorized, security-relevant configuration changes detected are tracked.
- SV-50479r2_rule V-38678 The audit system must provide a warning when allocated audit record storage volume reaches a documented percentage of maximum audit record storage capacity.
- SV-50482r2_rule V-38681 All GIDs referenced in /etc/passwd must be defined in /etc/group
- SV-50483r6_rule V-38682 The Bluetooth kernel module must be disabled.
- SV-50484r1_rule V-38683 All accounts on the system must have unique user or account names
- SV-50486r1_rule V-38685 Temporary accounts must be provisioned with an expiration date.
- SV-50487r2_rule V-38686 The systems local firewall must implement a deny-all, allow-by-exception policy for forwarded packets.
- SV-50490r5_rule V-38689 The Department of Defense (DoD) login banner must be displayed immediately prior to, or as part of, graphical desktop environment login prompts.
- SV-50491r1_rule V-38690 Emergency accounts must be provisioned with an expiration date.
- SV-50496r2_rule V-38695 A file integrity tool must be used at least weekly to check for unauthorized file changes, particularly the addition of unauthorized system libraries or binaries, or for unauthorized modification to authorized system libraries or binaries.
- SV-50497r2_rule V-38696 The operating system must employ automated mechanisms, per organization defined frequency, to detect the addition of unauthorized components/devices into the operating system.
- SV-50498r2_rule V-38697 The sticky bit must be set on all public directories.
- SV-50499r2_rule V-38698 The operating system must employ automated mechanisms to detect the presence of unauthorized software on organizational information systems and notify designated organizational officials in accordance with the organization defined frequency.
- SV-50500r2_rule V-38699 All public directories must be owned by a system account.
- SV-50501r2_rule V-38700 The operating system must provide a near real-time alert when any of the organization defined list of compromise or potential compromise indicators occurs. 
- SV-50503r2_rule V-38702 The FTP daemon must be configured for logging or verbose mode.
- SV-55880r2_rule V-43150 The login user list must be disabled.
- SV-65589r1_rule V-51379 All device files must be monitored by the system Linux Security Module.
- SV-65601r1_rule V-51391 A file integrity baseline must be created.
- SV-71919r1_rule V-57569 The noexec option must be added to the /tmp partition.
- SV-73331r2_rule V-58901 The sudo command must require authentication.
- SV-87461r1_rule V-72817 Wireless network adapters must be disabled.
- SV-96157r1_rule V-81443 The Red Hat Enterprise Linux operating system must have an anti-virus solution installed.
- SV-102359r1_rule V-92257 System and Application account passwords must be changed at least annually.
- SV-106367r1_rule V-97229 The Red Hat Enterprise Linux operating system must implement NIST FIPS-validated cryptography for the following: to provision digital signatures, to generate cryptographic hashes, and to protect data requiring data-at-rest protections in accordance with applicable federal laws, Executive Orders, directives, policies, regulations, and standards.
- SV-106369r1_rule V-97231 The SSH daemon must be configured to only use Message Authentication Codes (MACs) employing FIPS 140-2 approved cryptographic hash algorithms.
- SV-109115r1_rule V-100011 The Red Hat Enterprise Linux operating system must not contain .shosts or shosts.equiv files.
- SV-109117r1_rule V-100013 The Red Hat Enterprise Linux operating system must be configured so that the SSH daemon is configured to only use Message Authentication Codes (MACs) employing FIPS 140-2 approved cryptographic hash algorithms.
