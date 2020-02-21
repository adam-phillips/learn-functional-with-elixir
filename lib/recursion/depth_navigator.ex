defmodule DepthNavigator do
  @moduledoc """
    More controlled module for navigating a system directory, using a maximum
    depth as a stopping point. So, beginning at root directory ~/ the
    furthest this would navigate is root/children/children and then stop if
    there is still navigation that could take place
  """
  @max_depth 2

  @doc """
    Entry point to navigation, where the starting directory is passed to be
    used as the entry point. The call to go_through/2 now includes an
    accumulator for tracking the depth of navigation
  """
  def navigate(dir) do
    expanded_dir = Path.expand(dir)
    go_through([expanded_dir], 0)
  end

  defp print_and_navigate(_dir, false, _current_depth), do: nil
  defp print_and_navigate(dir, true, current_depth) do
    IO.puts dir
    children_dirs = File.ls!(dir)
    go_through(expand_dirs(children_dirs, dir), current_depth + 1)
  end

  defp go_through([], _current_depth), do: nil
  defp go_through(_dirs, current_depth) when current_depth > @max_depth, do: nil
  defp go_through([content | rest], current_depth) do
    print_and_navigate(content, File.dir?(content), current_depth)
    go_through(rest, current_depth)
  end
end
