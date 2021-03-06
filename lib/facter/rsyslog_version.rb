# rsyslog_version.rb

Facter.add("rsyslog_version") do
  setcode do
    test_exists = "rsyslogd -v 2>&1 >/dev/null ; echo $?"
    if Facter::Util::Resolution.exec(test_exists) == '0'
      cmd = "rsyslogd -v | grep -Eo [0-9]+\.[0-9]+\.[0-9]+"
      response = Facter::Util::Resolution.exec(cmd)
    end
  end
end
