# in ~/.pryrc

def _dump_local_variables(pry)
  Thread.new do
    File.open("#{ENV['HOME']}/.pry_locals", 'w') do |f|
      f.puts Pry::Command::Ls::LocalVars.new({}, pry).output_self
    end
  end
end

Pry.hooks.add_hook(:when_started, :dump_local_vars) do |_result, _options, pry|
  _dump_local_variables(pry)
end

Pry.hooks.add_hook(:after_eval, :dump_local_vars) do |_result, pry|
  _dump_local_variables(pry)
end

Pry.hooks.add_hook(:after_session, :dump_local_vars) do |_result, _binding, pry|
  _dump_local_variables(pry)
end
