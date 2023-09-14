# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A 33-line alternative to the popular launchy library"
HOMEPAGE="https://github.com/sunaku/opener"

LICENSE="Ruby"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


