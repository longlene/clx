# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="RUTorrent is a Ruby library for the remote management of uTorrent clients
via the Web UI API"
HOMEPAGE="http://cbg.me/"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/json-1.5.1"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.4.4"
ruby_add_rdepend ">=dev-ruby/bundler-0"

