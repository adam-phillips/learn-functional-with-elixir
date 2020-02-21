defmodule Navigator do
  @moduledoc """
    Module demonstrating unbounded recursion, where we don't know how many
    repetitions will be made. This recursively maps a computer file system
    beginning at the directory given as an entry point
  """

  @doc """
    Main function that expands a directory and triggers a recursive traversal
    through the system directory
  """
  def navigate(dir) do
    expanded_dir = Path.expand(dir)
    go_through([expanded_dir])
  end

  defp go_through([]), do: nil
  defp go_through([content | rest]) do
    print_and_navigate(content, File.dir?(content))
    go_through(rest)
  end

  defp print_and_navigate(_dir, false), do: nil
  defp print_and_navigate(dir, true) do
    IO.puts dir
    children_dirs = File.ls!(dir)
    go_through(expand_dirs(children_dirs, dir))
  end

  defp expand_dirs([], _relative_to), do: []
  defp expand_dirs([dir | dirs], relative_to) do
    expanded_dir = Path.expand(dir, relative_to)
    [expanded_dir | expand_dirs(dirs, relative_to)]
  end
end
