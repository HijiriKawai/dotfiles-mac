#!/opt/homebrew/bin/zsh

echo "install and update languages with mise."

languages=("deno" "elixir" "erlang" "flutter" "golang" "node" "python" "pnpm" "dotnet-core")


for language in $languages; do
  which mise >/dev/null 2>&1 && mise install $language && mise use -g $language
done
