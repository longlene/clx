# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Essential backports that enable many of the nice features of Ruby 1.8.7 up to 2.0.0 for earlier versions."
HOMEPAGE="http://github.com/marcandre/backports"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


