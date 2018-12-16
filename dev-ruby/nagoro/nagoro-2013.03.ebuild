# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.markdown"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An extendible and fast templating engine in pure ruby"
HOMEPAGE="http://github.com/manveru/nagoro"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


