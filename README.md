# LaunchConfigurationCleaner

You can remove many LaunchConfigurations (AWS autoscaling setting) easier.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'launch_configuration_cleaner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install launch_configuration_cleaner

## Usage

1. Execute `clean_lc` in your terminal.

```
$ clean_lc
```

2. Then, this app shows your LaunchConfigurations.

```
[
  YourLaunchConfiguration1,
  YourLaunchConfiguration2,
  YourLaunchConfiguration3,
  YourLaunchConfiguration4,
  YourLaunchConfiguration5,
]
```

3. Enter "y", if you want to remove a LaunchConfiguration

```
Do you want to delete YourLaunchConfiguration1? (y/n)
```

4. After judging each configurations, you need to enter a final answer.

```
These launch configurations will be deleted.
[
  YourLaunchCOnfiguration1,
  YourLaunchCOnfiguration3,
  YourLaunchCOnfiguration5,
]
Are you sure? (yes or no)
```

If you enter "yes", LaunchConfigurations will be deleted.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/launch_configuration_cleaner/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
