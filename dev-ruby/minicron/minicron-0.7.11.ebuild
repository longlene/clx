# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/jamesrwhite/minicron"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rainbow-2.0"
ruby_add_rdepend ">=dev-ruby/commander-4.2"
ruby_add_rdepend ">=dev-ruby/thin-1.6"
ruby_add_rdepend ">=dev-ruby/faye-1.0"
ruby_add_rdepend ">=dev-ruby/eventmachine-1.0"
ruby_add_rdepend ">=dev-ruby/toml-rb-0.3"
ruby_add_rdepend ">=dev-ruby/sinatra-1.4"
ruby_add_rdepend ">=dev-ruby/erubis-2.7"
ruby_add_rdepend ">=dev-ruby/activerecord-4.0"
ruby_add_rdepend ">=dev-ruby/sinatra-activerecord-1.7"
ruby_add_rdepend ">=dev-ruby/sinatra-assetpack-0.3"
ruby_add_rdepend ">=dev-ruby/sass-3.2"
ruby_add_rdepend ">=dev-ruby/oj-2.6"
ruby_add_rdepend ">=dev-ruby/sshkey-1.6"
ruby_add_rdepend ">=dev-ruby/net-ssh-2.8"
ruby_add_rdepend ">=dev-ruby/parse-cron-0.1"
ruby_add_rdepend ">=dev-ruby/mail-2.5"
ruby_add_rdepend ">=dev-ruby/twilio-ruby-3.1"
ruby_add_rdepend ">=dev-ruby/pagerduty-1.3"
ruby_add_rdepend ">=dev-ruby/insidious-0.3"
ruby_add_rdepend "=dev-ruby/escape-0.0.4"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"
ruby_add_rdepend ">=dev-ruby/em-http-request-1.1"
ruby_add_rdepend ">=dev-ruby/aws-sdk-2.1"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.8"
ruby_add_rdepend ">=dev-ruby/guard-2.12"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.5"
ruby_add_rdepend ">=dev-ruby/guard-bundler-2.1"

