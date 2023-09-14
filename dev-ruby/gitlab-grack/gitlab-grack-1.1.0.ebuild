# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=grack.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby/Rack Git Smart-HTTP Server Handler"
HOMEPAGE="https://github.com/gitlabhq/grack"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.4.1"

