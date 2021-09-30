defmodule ExercismFormatter do
  @moduledoc """
  ExercismFormatter keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  @formatter_commands Application.compile_env(:exercism_formatter, :formatter_commands)

  def get_commands(language) do
    case @formatter_commands[language] do
      nil -> :not_found
      commands -> {:ok, commands}
    end
  end

  def format_file(%{command: command, options: options, filepath: path}) do
    System.cmd(command, options ++ [path], stderr_to_stdout: true, parallelism: true)
  end

  def random_string(size) do
    for _ <- 1..size, into: "" do
      <<Enum.random(?a..?z)>>
    end
  end
end
