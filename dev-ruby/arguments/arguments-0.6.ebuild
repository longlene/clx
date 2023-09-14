# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="You don't have to wait until Ruby 2"
HOMEPAGE="http://github.com/maca/arguments"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ruby_parser-2.0.2"
ruby_add_rdepend ">=dev-ruby/ParseTree-3.0.3"
ruby_add_rdepend "=dev-ruby/ruby2ruby-1.1.9"
ruby_add_rdepend ">=dev-ruby/rubyforge-2.0.3"
ruby_add_rdepend ">=dev-ruby/gemcutter-0.3.0"
ruby_add_rdepend ">=dev-ruby/hoe-2.5.0"

