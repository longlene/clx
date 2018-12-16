# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Tool which allows to quickly try the demo project of any Android Library"
HOMEPAGE="https://github.com/cesarferreira/dryrun"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-3.1"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/bundler-1.7"
ruby_add_rdepend ">=dev-ruby/colorize-0.7"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6.6.2"

