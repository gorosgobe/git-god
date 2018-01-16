module FileUtilities

  def FileUtilities.delete_line_with_key(key)
    tmp_file = Tempfile.new(TEMP_CONFIG)
    file = open_config_file
    begin
      file.each_line do |line|
        next if line.split("=")[0] == key
        tmp_file.puts(line)
      end
      tmp_file.close
      # change the name and overwrite
      FileUtils.mv(tmp_file, file)
      file
    ensure
      tmp_file.close
      tmp_file.unlink
      file.close
    end
  end

  def FileUtilities.write_to_file_or_overwrite(flag, new_value)
    tmp_file = Tempfile.new(TEMP_CONFIG)
    file = open_config_file
    has_been_written = false
    begin
      file.each_line do |line|
        if line.split("=")[0] == flag
          # overwrite
          has_been_written = true
          tmp_file.puts(new_value)
        else
          tmp_file.puts(line)
        end
      end

      # no line exists
      unless has_been_written
        tmp_file.puts(new_value)
      end
      tmp_file.close
      # change the name and overwrite
      FileUtils.mv(tmp_file, file)
      file.close
    ensure
      tmp_file.close
      tmp_file.unlink
      file.close
    end
  end

  def FileUtilities.write_to_file(file_name, value)
    # assumes file is not opened
    file = File.open(file_name, "a")
    file.puts(value)
    file.close
  end
end