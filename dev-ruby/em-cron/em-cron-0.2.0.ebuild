# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Simple Eventmachine library for running code on a schedule using the crontab syntax"
HOMEPAGE="https://github.com/dgvz/em-cron"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/parse-cron-0.1"
ruby_add_rdepend ">=dev-ruby/eventmachine-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.9"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"

