# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Provide Ruby core source files for C extensions that need them"
HOMEPAGE="http://github.com/cldwalker/debugger-ruby_core_source"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/archive-tar-minitar-0.5.2"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2"

