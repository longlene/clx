# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Serpent is a Python style smart contract language"
HOMEPAGE="https://github.com/janx/ruby-serpent"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-10.5"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.9"
ruby_add_rdepend ">=dev-ruby/rice-2.1"
ruby_add_rdepend "=dev-ruby/minitest-5.8.3"
ruby_add_rdepend "=dev-ruby/yard-0.8.7.6"

