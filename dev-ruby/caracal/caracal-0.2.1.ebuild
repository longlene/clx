# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=" Caracal is a pure Ruby MSWord generation library that produces professional quality Word documents using a simple, HTML-style DSL"
HOMEPAGE="https://github.com/trade-informatics/caracal"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.6"
ruby_add_rdepend ">=dev-ruby/rubyzip-1.1"
ruby_add_rdepend ">=dev-ruby/tilt-1.4"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"

