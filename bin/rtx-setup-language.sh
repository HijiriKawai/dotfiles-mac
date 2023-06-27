#!/opt/homebrew/bin/zsh

echo "install and update languages with rtx."

languages=("deno" "elixir" "flutter" "golang" "node" "python" "rust" "yarn")

for language in $languages; do
  which rtx >/dev/null 2>&1 && rtx install $language && rtx use -g $language
done
