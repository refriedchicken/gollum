defmodule GollumTest do
  use ExUnit.Case
  alias Gollum.Cache
  doctest Gollum

  setup do
    Cache.start_link(name: TestCache, fetcher: MockFetcher)
    :ok
  end

  test "uses port to diffentiate hosts" do
    # Uses a fake response from MockFetcher
    assert Gollum.crawlable?("Hello", "http://example.net:8080/some_path", name: TestCache) == :uncrawlable
  end
end
