# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby/ProgressBar is an extremely flexible text progress bar library for Ruby"
HOMEPAGE="https://github.com/jfelchner/ruby-progressbar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend ">=dev-ruby/rspectacular-0.21.6"
ruby_add_rdepend ">=dev-ruby/fuubar-2.0"
ruby_add_rdepend ">=dev-ruby/warning_filter-0.0.2"
ruby_add_rdepend ">=dev-ruby/timecop-0.6.0"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0.3.0"

