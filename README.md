homebrew-ubiq
=============

Homebrew Tap for Ubiq (forked from original [homebrew-ethereum](https://github.com/ethereum/homebrew-ethereum) repository)

## Installation

```
brew tap ubiq/ubiq
```

### Go client
```
brew install ubiq
```
## Running

### Go client
`gubiq`

## Development
Get the latest development version with the `--devel` flag. Use `--build-from-source` if you don't want a pre-built bottle.

### Go client
```
brew reinstall ubiq --devel
```

### Current branches

Go:
* `--devel` is on develop branch
* normal install is on master branch

## Upgrading

```
brew update && brew upgrade
```

## Minor updates

### Go client
```
brew update && brew reinstall ethereum
```

## Versions
List available versions with:
```
ls -l /usr/local/Cellar/ubiq
```

If you have other versions installed, you can switch with:
```
brew switch ubiq <version>
```
Or follow this [StackOverflow answer](http://stackoverflow.com/a/9832084/2639784)

These brews can be installed via the raw GitHub URLs, or by cloning this
repository locally with `brew tap ethereum/ethereum`. You can also install binary
bottles directly with `brew install <bottle_url>`, see [cpt-obvious](https://build.ethdev.com/waterfall)
for previous builds.


##Options

See `brew info ubiq` for all options. `--with-...` features are experimental patches.

##Troubleshooting

* Use `--verbose` to get more info while installing.
* Make sure to update XCode and the command line tools.
* Run `brew update` and `brew upgrade`
* Fix what the `brew doctor` says.
* Reinstall dependencies: `brew reinstall boost --c++11 --with-python`
* Make changes to `/usr/local/Library/Taps/ubiq/ubiq/ubiq.rb`
* Reinstall with `brew reinstall ubiq.rb` (send a pull request!)
* Take a walk


##Patching

First `cd /Library/Caches/Homebrew/ubiq--git/` and make your changes. Then `git diff > shiny.patch`, copy/paste the content of your patch under `__END__` of `ubiq.rb` and replace the `def patches` block with:

```
def patches
  DATA
end
```

If you want to submit your change, save your patch in a gist, add your `option 'shiny-option', 'Shiny description'` and the URL to your gist in the patches block and submit a pull request. Make sure to send a pull request to Ethereum also!
