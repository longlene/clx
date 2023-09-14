# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A DSL for easily defining keyboard events for a Gosu::Window"
HOMEPAGE="http://github.com/c00lryguy/gosu-keyboard"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/version-1.0.0"
ruby_add_rdepend ">=dev-ruby/active_support-3.0.0"
ruby_add_rdepend ">=dev-ruby/gosu-0.7.0"
ruby_add_rdepend ">=dev-ruby/rake-0.9"

