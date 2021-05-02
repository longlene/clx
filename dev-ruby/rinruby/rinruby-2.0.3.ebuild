# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RinRuby is a Ruby library that integrates the R interpreter in Ruby, making R's statistical routines and graphics available within Ruby"
HOMEPAGE="http://rinruby.ddahl.org/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-lang/R"

ruby_add_rdepend ">=dev-ruby/rdoc-3.10"
ruby_add_rdepend ">=dev-ruby/hoe-3.0"

