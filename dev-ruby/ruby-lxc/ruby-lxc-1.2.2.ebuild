# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Ruby-LXC is a Ruby binding for the liblxc library, allowing
    Ruby scripts to create and manage Linux containers"
HOMEPAGE="https://github.com/lxc/ruby-lxc"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rdoc-0"
ruby_add_rdepend ">=dev-ruby/rdoc-data-0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0"

