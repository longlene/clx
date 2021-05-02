# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Johnson wraps JavaScript in a loving Ruby embrace"
HOMEPAGE="http://github.com/jbarnette/johnson"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/gemcutter-0.2.1"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.6"
ruby_add_rdepend ">=dev-ruby/hoe-2.5.0"

