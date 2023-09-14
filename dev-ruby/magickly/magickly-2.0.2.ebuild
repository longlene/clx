# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A service for image manipulation - built as an extensible wrapper of Imagemagick which handles caching, c/o the Dragonfly gem"
HOMEPAGE="http://magickly.afeld.me"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.2"
ruby_add_rdepend ">=dev-ruby/dragonfly-0.9.14"
ruby_add_rdepend ">=dev-ruby/addressable-2.2"
ruby_add_rdepend ">=dev-ruby/httparty-0.13"
ruby_add_rdepend ">=dev-ruby/activesupport-2.0.0"

