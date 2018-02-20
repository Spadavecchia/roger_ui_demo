defmodule RogerUiDemo.Worker.Callback do

  use Roger.Partition.Worker.Callback

  def before_run(partition, job) do
    IO.puts "[#{partition}] Start job: #{inspect job}"
  end

  def after_run(partition, job, _result, _state) do
    IO.puts "[#{partition}] Completed job: #{inspect job}"
  end

  def on_error(partition, job, {_error_type, error}, _stack, _before_run_state) do
    IO.puts "[#{partition}] Error #{inspect error}, in job: #{inspect job}"
  end
end
