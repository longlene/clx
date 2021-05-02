# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="daemon-kit aims to simplify creating Ruby daemons by providing a sound application skeleton (through a generator), task specific generators (jabber bot, etc) and robust environment management code"
HOMEPAGE="http://github.com/kennethkalmer/daemon-kit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-0.12.10"
ruby_add_rdepend ">=dev-ruby/thor-0"

