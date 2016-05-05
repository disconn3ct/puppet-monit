Puppet::Type.type(:service).provide(:monit, :parent => Puppet::Provider) do
  COMMAND = "/usr/bin/monit"

  def status
    results = `#{COMMAND} status`
    procs = results.split("\n\n")
    procs.each do |proc_info|
      lines = proc_info.split("\n")
      if lines[0].strip == "Process '#{resource[:name]}'"
        status = lines[1].split(" ")[1..-1].join(" ")
        return :stopped if status == "Not monitored"
        return :running if status == "Running"
      end
    end
    nil
  end

  def monit(action)
    # If you issue commands too fast, you'll get a message
    # Action failed -- Other action already in progress -- please try again later
    # So we retry the command a few times
    3.times { |i|
      system("#{COMMAND} #{action} #{resource[:name]}")
      if $?.success?
        break
      end
      sleep i
    }
    unless $?.success?
      raise "monit failed to #{action} #{resource[:name]}"
    end
  end

  def start
    monit('start')
  end

  def stop
    monit('stop')
  end

  def restart
    monit('restart')
  end
end
