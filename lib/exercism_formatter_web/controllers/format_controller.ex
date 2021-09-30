defmodule ExercismFormatterWeb.FormatController do
  use ExercismFormatterWeb, :controller

  def format(conn, %{"language" => language, "code" => code}) do
    {:ok, commands} = ExercismFormatter.get_commands(language)
    filename = ExercismFormatter.random_string(12)
    filepath = Path.join("/tmp", filename)
    File.write!(filepath, code)

    commands = Map.put(commands, :filepath, filepath)

    case ExercismFormatter.format_file(commands) do
      {_stdout, 0} ->
        formatted_code = File.read!(filepath)
        json(conn, %{status: "success", formatted_code: formatted_code})

      {error, 1} ->
        json(conn, %{status: "formatting error", error: error})
    end
  end
end
