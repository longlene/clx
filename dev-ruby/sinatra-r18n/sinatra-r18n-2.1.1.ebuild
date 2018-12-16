# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    A Sinatra extension that provides i18n support to translate your web
    application"
HOMEPAGE="https://github.com/ai/r18n/tree/master/sinatra-r18n"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-1.3"
ruby_add_rdepend "=dev-ruby/r18n-core-2.1.1"

