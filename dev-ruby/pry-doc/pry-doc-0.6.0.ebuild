# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32 jruby"

inherit ruby-fakegem

DESCRIPTION="Pry Doc is a Pry REPL plugin"
HOMEPAGE="https://github.com/pry/pry-doc"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pry-0.9"
ruby_add_rdepend ">=dev-ruby/yard-0.8"

