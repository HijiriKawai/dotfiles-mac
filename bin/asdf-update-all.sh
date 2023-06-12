#!/opt/homebrew/bin/zsh

echo "install and update languages with asdf."

languages=("deno" "elixir" "flutter" "golang" "nodejs" "python" "rust" "yarn")

for language in $languages; do
  which asdf >/dev/null 2>&1 && asdf install $language latest && asdf global $language latest
done
